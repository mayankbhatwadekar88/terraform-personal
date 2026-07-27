check "website_checker" {
  
  data "http" "example" {
    url = "https://googley9249.com"
  }
  assert {
    condition = data.http.example.status_code == 200
    error_message = "Website is not running"
  }
}

resource "local_file" "foo" {
  content = "Hi"
  filename = "${path.module}/foo.txt"
}
