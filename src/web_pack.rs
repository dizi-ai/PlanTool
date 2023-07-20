use axum::{http::StatusCode, routing::get, Router, response::Redirect};

async fn index() -> Redirect {
    Redirect::permanent("/home")
}

async fn homepage() -> String {
    String::from("homepage")
}

async fn calendar() -> String {
    String::from("calendar")
}

async fn board() -> String {
    String::from("board")
}

async fn profile() -> String {
    String::from("profile")
}

pub fn create_router() -> Router {
    Router::new()
        .route("/", get(index))
        .route("/home", get(homepage))
        .route("/calendar", get(calendar))
        .route("/board", get(board))
        .route("/profile", get(profile))
}