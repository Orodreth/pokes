"""
    Routes Configuration File

    Put Routing rules here
"""
from system.core.router import routes

routes['default_controller'] = 'Sessions'
routes["POST"]["/register"] = "Sessions#register"
routes["POST"]["/login"] = "Sessions#login"
routes["/logout"] = "Sessions#logout"

routes["/pokes"] = "Pokes#index"
routes["POST"]["/poke/<receiver_id>"] = "Pokes#poke"
