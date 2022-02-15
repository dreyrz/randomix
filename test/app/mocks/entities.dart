import 'package:mocktail/mocktail.dart';

import 'package:randomix/app/modules/home/domain/entities/album.dart';
import 'package:randomix/app/modules/home/domain/entities/artist.dart';
import 'package:randomix/app/modules/home/domain/entities/track.dart';

class ArtistMock extends Mock implements Artist {}

class AlbumMock extends Mock implements Album {}

class TrackMock extends Mock implements Track {}
