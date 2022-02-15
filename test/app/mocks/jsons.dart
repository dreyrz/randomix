const getTokenJson = r'''
{"access_token":"BQAWLmqUZmqw5BCDI_fY0rmPHIeyfffjFhxJuwE2k1byNDwc5CJjFV7JgcIXJMVP-hQg0KaeRWT4ql_JCn4","token_type":"Bearer","expires_in":3600}
''';
const getRandomTrackByGenreJson = r'''
  {
  "tracks": [
    {
      "album": {
        "album_type": "ALBUM",
        "artists": [
          {
            "external_urls": {
              "spotify": "https://open.spotify.com/artist/0du5cEVh5yTK9QJze8zA0C"
            },
            "href": "https://api.spotify.com/v1/artists/0du5cEVh5yTK9QJze8zA0C",
            "id": "0du5cEVh5yTK9QJze8zA0C",
            "name": "Bruno Mars",
            "type": "artist",
            "uri": "spotify:artist:0du5cEVh5yTK9QJze8zA0C"
          }
        ],
        "external_urls": {
          "spotify": "https://open.spotify.com/album/1uyf3l2d4XYwiEqAb7t7fX"
        },
        "href": "https://api.spotify.com/v1/albums/1uyf3l2d4XYwiEqAb7t7fX",
        "id": "1uyf3l2d4XYwiEqAb7t7fX",
        "images": [
          {
            "height": 640,
            "url": "https://i.scdn.co/image/ab67616d0000b273f6b55ca93bd33211227b502b",
            "width": 640
          },
          {
            "height": 300,
            "url": "https://i.scdn.co/image/ab67616d00001e02f6b55ca93bd33211227b502b",
            "width": 300
          },
          {
            "height": 64,
            "url": "https://i.scdn.co/image/ab67616d00004851f6b55ca93bd33211227b502b",
            "width": 64
          }
        ],
        "name": "Doo-Wops & Hooligans",
        "release_date": "2010-10-05",
        "release_date_precision": "day",
        "total_tracks": 10,
        "type": "album",
        "uri": "spotify:album:1uyf3l2d4XYwiEqAb7t7fX"
      },
      "artists": [
        {
          "external_urls": {
            "spotify": "https://open.spotify.com/artist/0du5cEVh5yTK9QJze8zA0C"
          },
          "href": "https://api.spotify.com/v1/artists/0du5cEVh5yTK9QJze8zA0C",
          "id": "0du5cEVh5yTK9QJze8zA0C",
          "name": "Bruno Mars",
          "type": "artist",
          "uri": "spotify:artist:0du5cEVh5yTK9QJze8zA0C"
        }
      ],
      "disc_number": 1,
      "duration_ms": 220734,
      "explicit": false,
      "external_ids": {
        "isrc": "USAT21001269"
      },
      "external_urls": {
        "spotify": "https://open.spotify.com/track/7BqBn9nzAq8spo5e7cZ0dJ"
      },
      "href": "https://api.spotify.com/v1/tracks/7BqBn9nzAq8spo5e7cZ0dJ",
      "id": "7BqBn9nzAq8spo5e7cZ0dJ",
      "is_local": false,
      "is_playable": true,
      "name": "Just the Way You Are",
      "popularity": 83,
      "preview_url": "https://p.scdn.co/mp3-preview/5e59e1274014d5fea89b447b392c7aeb625577c3?cid=774b29d4f13844c495f206cafdad9c86",
      "track_number": 2,
      "type": "track",
      "uri": "spotify:track:7BqBn9nzAq8spo5e7cZ0dJ"
    }
  ],
  "seeds": [
    {
      "initialPoolSize": 1255,
      "afterFilteringSize": 1255,
      "afterRelinkingSize": 1255,
      "id": "pop",
      "type": "GENRE",
      "href": null
    }
  ]
}
''';