defmodule UrlUnrollerApp do
  import Plug.Conn

  def init(options) do
    options
  end

  def call(conn, _opts) do
    conn = fetch_params(conn)

    unroll(conn, conn.params["url"])
  end

  defp render_text(conn, text) do
    conn |>
      put_resp_content_type("text/plain") |>
      send_resp(200, text)
  end

  defp unroll(conn, nil) do
    render_text conn, "you should provide a url"
  end

  defp unroll(conn, url) do
    render_unroll_result conn, UrlUnroller.unroll(url)
  end

  defp render_unroll_result(conn, {:ok, url, _response}) do
    render_text conn, url
  end

  defp render_unroll_result(conn, {:error, url, {response_status, response}}) do
    render_text conn, Enum.join([
      "Error @ #{url}",
      to_string(response_status),
      to_string(response.status_code)
    ], "\n\n")
  end
end

IO.inspect {:ok, _} = Plug.Adapters.Cowboy.http UrlUnrollerApp, []
