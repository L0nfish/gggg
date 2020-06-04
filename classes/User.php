<?php
class User extends Table
{
    public function validate()
    {
        if (!empty($this->lastname) &&
            !empty($this->firstname) &&
            !empty($this->login) &&
            !empty($this->pass) &&
            !empty($this->role_id) &&
            !empty($this->gender_id)) {
            return true;
        }
        return false;
    }
}
