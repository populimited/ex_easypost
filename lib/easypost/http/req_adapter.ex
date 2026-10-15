defmodule EasyPost.HTTP.ReqAdapter do
  @behaviour EasyPost.HTTP

  @impl true
  @spec request(
          EasyPost.http_method_t(),
          String.t(),
          EasyPost.http_headers_t(),
          String.t(),
          any
        ) :: {:ok, EasyPost.HTTP.response_t()} | {:error, any}

  def request(method, url, headers, body, opts) do
    req_options = [
      method: method,
      url: url,
      headers: headers,
      body: body,
      decode_body: false
    ]

    case Req.request(req_options, opts) do
      {:ok, %Req.Response{body: body, status: status} = response} ->
        {:ok,
         %{
           body: body,
           headers: Req.Response.to_map(response).headers,
           status_code: status
         }}

      {:error, reason} ->
        {:error, reason}
    end
  end
end
