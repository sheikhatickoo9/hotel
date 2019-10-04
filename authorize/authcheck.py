def authentication(auth,role_id,user_role_id):
    if auth is True:
            if role_id==user_role_id:
                return True
            else:
                return False,"Invalid_user"
    else:
        return False, "not valid login"