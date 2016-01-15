var collection = require('javascript-collection-paraphernalia');

function Users() {
    this.users = [];
}

Users.prototype.makeUser = function(id, name, nameExistsCallback) {
    if (this.nameExists(name)) {
        if (nameExistsCallback) {
            nameExistsCallback();
        }
        return false;
    }

    var user = {
        id: id,
        name: name,
        joined: new Date()
    }

    this.users.push(user);
    return user;
};

Users.prototype.getUser = function(id) {
    return collection.find(this.users, function(item)  {
        return item.id === id;
    });
}

Users.prototype.nameExists = function(name) {
    return !!collection.find(this.users, function(item) {
        return item.name === name;
    });
}

Users.prototype.setName = function(id, name, nameExistsCallback, nameChangedCallback) {
    var user = this.getUser(id);

    if (user.name === name) {
        return;
    }

    if (this.nameExists(name)) {
        if (nameExistsCallback) {
            nameExistsCallback();
        }
        return;
    }

    user.name = name;

    if (nameChangedCallback) {
        nameChangedCallback();
    }
}

module.exports = Users;
