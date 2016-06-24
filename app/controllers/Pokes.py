from system.core.controller import *

class Pokes(Controller):
    def __init__(self, action):
        super(Pokes, self).__init__(action)
        self.load_model("User")

    def index(self):
    	user = self.models["User"].get_user_info(session["user_id"])
    	count = self.models["User"].get_poke_sender_count(session["user_id"])
    	poked_history = self.models["User"].get_poke_history_by_user(session["user_id"])
    	poke_list = self.models["User"].get_poke_history_except_curr_user(session["user_id"])

    	return self.load_view("pokes/index.html", user = user, count = count, poked_history = poked_history, poke_list = poke_list)

    def poke(self, receiver_id):
    	self.models["User"].poke(session["user_id"], receiver_id)
    	return redirect("/pokes")