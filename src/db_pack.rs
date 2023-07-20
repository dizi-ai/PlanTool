use sqlx::postgres::PgPoolOptions;
use sqlx::FromRow;
use sqlx::types::time::Date;

use std::sync::Arc;

struct PostgresCon{

}

pub fn create_user() -> Result<String,String>{
    Ok(String::from("success"))
}

pub fn authentification(login: String, password: String) -> Result<String,String> {
    Ok(String::from("success"))
}

