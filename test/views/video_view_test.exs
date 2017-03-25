defmodule Rumbl.PageViewTest do
  use Rumbl.ConnCase, async: true
  import Phoenix.View

  test "renders index.html", %{conn: conn} do
    videos = [%Rumbl.Video{id: "1", title: "dogs"},
              %Rumbl.Video{id: "2", title: "cats"}]
    content = render_to_string(Rumbl.VideoView, "index.html", conn: conn, videos: videos)

    assert String.contains?(content, "Listing videos")
    for video <- videos do
      assert String.contains?(content, video.title)
    end
  end
  k
  test "renders new.html", %{conn: conn} do
    changeset = Video.changeset
    content = render_to_string(Rumbl.VideoView, "new.html", conn: conn, changeset: changeset)

    assert String.contains?(content, "Listing videos")
    for video <- videos do
      assert String.contains?(content, video.title)
    end
  end
end
