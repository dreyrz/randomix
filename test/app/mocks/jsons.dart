import 'package:randomix/app/modules/home/domain/usecases/get_genres.dart';

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

const getGenresJson =
    r'''{"genres":["acoustic","afrobeat","alt-rock","alternative","ambient","anime","black-metal","bluegrass","blues","bossanova","brazil","breakbeat","british","cantopop","chicago-house","children","chill","classical","club","comedy","country","dance","dancehall","death-metal","deep-house","detroit-techno","disco","disney","drum-and-bass","dub","dubstep","edm","electro","electronic","emo","folk","forro","french","funk","garage","german","gospel","goth","grindcore","groove","grunge","guitar","happy","hard-rock","hardcore","hardstyle","heavy-metal","hip-hop","holidays","honky-tonk","house","idm","indian","indie","indie-pop","industrial","iranian","j-dance","j-idol","j-pop","j-rock","jazz","k-pop","kids","latin","latino","malay","mandopop","metal","metal-misc","metalcore","minimal-techno","movies","mpb","new-age","new-release","opera","pagode","party","philippines-opm","piano","pop","pop-film","post-dubstep","power-pop","progressive-house","psych-rock","punk","punk-rock","r-n-b","rainy-day","reggae","reggaeton","road-trip","rock","rock-n-roll","rockabilly","romance","sad","salsa","samba","sertanejo","show-tunes","singer-songwriter","ska","sleep","songwriter","soul","soundtracks","spanish","study","summer","swedish","synth-pop","tango","techno","trance","trip-hop","turkish","work-out","world-music"]}''';
