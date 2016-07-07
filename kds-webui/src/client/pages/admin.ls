require! {
    'aea': {
        signup
        PouchDB
        sleep
    }
    'components': {
        InteractiveTable
    }
}

Ractive.components['interactive-table'] = InteractiveTable


# Ractive definition
ractive = new Ractive do
    el: '#main-output'
    template: '#main-template'
    data:
        login:
            err: null
            ok: no
            user: null
            new-user: null
        db: \set-later
        user:
            name: \demeter
            passwd: \hPwZLjgITAlqk
        users-auth: null


db = new PouchDB 'https://demeter.cloudant.com/_users', skip-setup: yes
local = new PouchDB \local_db
ractive.set \db, db

ractive.on do
    do-login: ->
        user = ractive.get \user
        ajax-opts = ajax: headers:
            Authorization: "Basic #{window.btoa user.name + ':' + user.passwd}"
        console.log "Logging in with #{user.name} and #{user.passwd}"
        err, res <- db.login user.name, user.passwd, ajax-opts
        if err
            console.log "Error while logging in: ", err
            ractive.set \login.err, {msg: err.message}
        else
            console.log "Logged  in: ", res
            err, res <- db.get-session
            console.log "Session: ", err, res.userCtx
            if res.userCtx.name
                ractive.set \login.err, null
                ractive.set \login.ok, yes
                after-logged-in!
    do-logout: ->
        console.log "Logging out!"
        err, res <- db.logout!
        console.log "Logged out: err: #{err}, res: ", res
        ractive.set \login.ok, null if res.ok

    add-user: ->
        new-user = @get \newUser
        console.log "Adding user!", new-user?.name
        # admin should already be logged in `_users` database
        err, res <- signup db, new-user.name, new-user.passwd
        if not err
            console.log "Successfully added new user: ", new-user.name
        else
            console.log "ERROR: Adding new user: ", err




# check whether we are logged in or not
feed = null
do function after-logged-in
    console.log "RUNNING AFTER_LOGGED_IN..."

    err, res <- db.info
    console.log "DB info: ", err, res

    err, res <- db.get-session
    console.log "Session info: ", err, res
    return if err

    # Set ractive login variable
    ractive.set \login, {user: res.userCtx, +ok}

    # Subscribe the changes...
    feed?.cancel!
    feed := local.sync db, {+live, +retry, since: \now}
        .on \error, -> feed.cancel!
        .on 'change', (change) ->
            console.log "change detected!", change


    do # get the _auth design document
        err, res <- db.query '_design/_auth'
        if err
            # put a new design document
            console.log "Putting a new _auth document..."
            auth =
                _id: '_design/_auth'

            err, res <- db.put auth
            console.log "Put design document: ", res if not err
        else
            console.log "Current _auth document: ", res
