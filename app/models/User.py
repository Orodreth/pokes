from system.core.model import Model

import re
from datetime import date

class User(Model):
    def __init__(self):
        super(User, self).__init__()

    def create_user(self, user):
        EMAIL_REGEX = re.compile(r'^[a-zA-Z0-9\.\+_-]+@[a-zA-Z0-9\._-]+\.[a-zA-Z]*$')

        errors = []

        if len(user["name"]) < 1:
            errors.append("Name cannot be blank!")
        elif len(user["alias"]) < 1:
            errors.append("Alias cannot be blank!")
        elif len(user["email"]) < 1:
            errors.append("Email cannot be blank!")
        elif not EMAIL_REGEX.match(user["email"]):
            errors.append("Invalid Email format!")
        elif len(user["pwd"]) < 8:
            errors.append("Password should be at least 8 characters!")
        elif user["pwd"] != user["pwd_confirm"]:
            errors.append("Confirm password is not match with Password!")
        elif len(user["birthday"]) < 1:
            errors.append("Birthday cannot be blank!")
        elif user["birthday"] > str(date.today()):
            errors.append("Birthday should be before today!")

        sql = "select * from users where email = :email"
        data = {
            "email": user["email"]
        }
        result = self.db.query_db(sql, data)
        if len(result) > 0:
            errors.append("This email has already been used!")

        if len(errors) > 0:
            return { "status": False, "errors": errors }

        pwd = self.bcrypt.generate_password_hash(user["pwd"])
        sql = "insert into users(name, alias, email, password, birthday, created_at, updated_at) " \
            "values(:name, :alias, :email, :password, :birthday, NOW(), NOW())"
        data = {
            "name": user["name"],
            "alias": user["alias"],
            "email": user["email"],
            "password": pwd,
            "birthday": user["birthday"]
        }
        
        user_id = self.db.query_db(sql, data)

        return { "status": True, "user_id": user_id }

    def login_user(self, info):
        sql = "select * from users where email = :email"
        data = {
            "email": info["email"]
        }
        result = self.db.query_db(sql, data)

        errors = []

        if result == None or len(result) == 0:
            errors.append("Invalid email!")
            return { "status": False, "errors": errors }

        if self.bcrypt.check_password_hash(result[0]["password"], info["pwd"]):
            return { "status": True, "user": result[0] }

        errors.append("Invalid password!")

        return { "status": False, "errors": errors }

    def get_user_info(self, user_id):
        sql = "select * from users where id = :id"
        data = {
            "id": user_id
        }
        return self.db.get_one(sql, data)

    def get_poke_sender_count(self, user_id):
        sql = "select count(distinct sender_id) as count from pokes where receiver_id = :id"
        data = {
            "id": user_id
        }
        return self.db.get_one(sql, data)["count"]

    def get_poke_history_by_user(self, user_id):
        sql = "select a.alias, count(*) as count from users a " \
            "join pokes b on a.id = b.sender_id " \
            "where b.receiver_id = :id " \
            "group by a.alias " \
            "order by count desc"
        data = {
            "id": user_id
        }
        return self.db.query_db(sql, data)

    def get_poke_history_except_curr_user(self, user_id):
        sql = "select a.id, a.name, a.alias, a.email, count(b.id) as count from users a " \
            "left join pokes b on a.id = b.receiver_id " \
            "where a.id <> :id " \
            "group by a.name, a.alias, a.email"
        data = {
            "id": user_id
        }
        return self.db.query_db(sql, data)

    def poke(self, sender_id, receiver_id):
        sql = "insert into pokes(sender_id, receiver_id, created_at, updated_at) values(:sender_id, :receiver_id, NOW(), NOW())"
        data = {
            "sender_id": sender_id,
            "receiver_id": receiver_id
        }
        return self.db.query_db(sql, data)
