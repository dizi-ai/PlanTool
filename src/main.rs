mod web_pack;

#[tokio::main]
async fn main() {
    
    let app = web_pack::create_router();

    axum::Server::bind(&"0.0.0.0:4000".parse().unwrap())
        .serve(app.into_make_service())
        .await
        .unwrap();
}