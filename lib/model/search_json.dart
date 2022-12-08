class MovieModel {
  String? name;
  String? thumbnail;
  String? url;
  String? story;

  MovieModel(this.name, this.thumbnail, this.url, this.story);
}

List<MovieModel> main_movie_list = [
  MovieModel(
      "Avatar 2:The Way Of Water",
      "https://firebasestorage.googleapis.com/v0/b/trailers-c1dc1.appspot.com/o/files%2Fimages%2Fthe-avatar-the-way-of-water.jpg?alt=media&token=35c38a54-31c2-4ff0-94cf-8661067b0f8f",
      "https://firebasestorage.googleapis.com/v0/b/trailers-c1dc1.appspot.com/o/files%2Ftrailer_videos%2FAvatar%20The%20Way%20of%20Water%20New%20Trailer.mp4?alt=media&token=5bbe0106-b6ff-4a1e-9abd-0154134c3413",
      "Avatar: The Way of Water tells the story of the Sully family, the trouble that follows them, the lengths they go to keep each other safe, the battles they fight to stay alive, and the tragedies they endure."),
  MovieModel(
      "Dungeons & Dragons Honor Among Thieves",
      "https://firebasestorage.googleapis.com/v0/b/trailers-c1dc1.appspot.com/o/files%2Fimages%2FDungeons%20%26%20Dragons%20Honor%20Among%20Thieves.jpg?alt=media&token=e3a8049f-0111-4ebb-a737-44179fd6b2a6",
      "https://firebasestorage.googleapis.com/v0/b/trailers-c1dc1.appspot.com/o/files%2Ftrailer_videos%2FDungeons%20%26%20Dragons%20Honor%20Among%20Thieves%20-%20Official%20Trailer.mp4?alt=media&token=463fed4d-95c7-47d6-b22b-99df1951a5a6",
      "A charming thief and a band of unlikely adventurers undertake an epic heist to retrieve a lost relic, but things go dangerously awry when they run afoul of the wrong people. Dungeons & Dragons: Honor Among Thieves brings the rich world and playful spirit of the legendary roleplaying game to the big screen in a hilarious and action-packed adventure."),
  MovieModel(
      "John Wick Chapter 4",
      "https://firebasestorage.googleapis.com/v0/b/trailers-c1dc1.appspot.com/o/files%2Fimages%2FJohn-Wick-Chapter-4-Movie-Poster.jpg?alt=media&token=14316bac-a75e-46fc-8994-6168249dea1c",
      "https://firebasestorage.googleapis.com/v0/b/trailers-c1dc1.appspot.com/o/files%2Ftrailer_videos%2FJohn%20Wick%20Chapter%204%20(2023%20Movie)%20Official%20Trailer%20%E2%80%93%20Keanu%20Reeves%2C%20Donnie%20Yen%2C%20Bill%20Skarsg%C3%A5rd.mp4?alt=media&token=ea3a4645-3ef4-41ed-9480-4eba07e92706",
      "John Wick uncovers a path to defeating The High Table. But before he can earn his freedom, Wick must face off against a new enemy with powerful alliances across the globe and forces that turn old friends into foes."),
  MovieModel(
      "Mission Impossible- Dead Reckoning part one",
      "https://firebasestorage.googleapis.com/v0/b/trailers-c1dc1.appspot.com/o/files%2Fimages%2Fmission-impossible-7-dead%20reckoning%20part1.jpg?alt=media&token=35976c74-e847-4db2-be02-c081902f5206",
      "https://firebasestorage.googleapis.com/v0/b/trailers-c1dc1.appspot.com/o/files%2Ftrailer_videos%2FMission%20Impossible%20%E2%80%93%20Dead%20Reckoning%20Part%20One%20Official%20Teaser%20Trailer%20(2023%20Movie)%20-%20Tom%20Cruise.mp4?alt=media&token=a86c7065-046c-4095-b4c4-9a3dfbdd4662",
      "Seventh entry in the long-running Mission: Impossible series."),
  MovieModel(
      "TROLL",
      "https://firebasestorage.googleapis.com/v0/b/trailers-c1dc1.appspot.com/o/files%2Fimages%2Ftroll.jpg?alt=media&token=986a3e6f-3906-4c9f-bb68-bbab3d28f3c6",
      "https://firebasestorage.googleapis.com/v0/b/trailers-c1dc1.appspot.com/o/files%2Ftrailer_videos%2FTROLL%20Official%20Trailer%20Netflix.mp4?alt=media&token=a4fd7a1a-0d3d-4410-ad7d-b106827c25ac",
      "Deep in the Dovre mountain, something gigantic wakes up after a thousand years in captivity. The creature destroys everything in its path and quickly approaches Oslo."),
  MovieModel(
      "Winnie the Pooh Blood and Honey",
      "https://firebasestorage.googleapis.com/v0/b/trailers-c1dc1.appspot.com/o/files%2Fimages%2FWinnie-the-Pooh-Blood%20and%20Honey.jpg?alt=media&token=a1bf2532-cc9a-42af-ba1e-7f2261408a80",
      "https://firebasestorage.googleapis.com/v0/b/trailers-c1dc1.appspot.com/o/files%2Ftrailer_videos%2FWinnie%20the%20Pooh%20Blood%20and%20Honey%20Trailer%20%231%20(2022).mp4?alt=media&token=34138b65-3833-4adf-a476-b65d0536a979",
      "It follows Pooh and Piglet as they go on a rampage after Christopher Robin abandons them for college."),
];
