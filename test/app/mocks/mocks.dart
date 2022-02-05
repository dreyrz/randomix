import 'package:randomix/app/modules/home/domain/entities/album.dart';
import 'package:randomix/app/modules/home/domain/entities/artist.dart';
import 'package:randomix/app/modules/home/domain/entities/track.dart';

const artistMock =
    Artist(id: 1, name: 'name', type: 'type', externalUrl: 'externalUrl');
const albumMock = Album(
    id: 1,
    name: 'name',
    type: 'type',
    albumCover: 'albumCover',
    externalUrl: 'externalUrl');

const trackMock = Track(
    id: 1,
    name: 'name',
    type: 'type',
    externalUrl: 'externalUrl',
    date: null,
    album: albumMock,
    artists: [artistMock]);

const anyString = 'test';
