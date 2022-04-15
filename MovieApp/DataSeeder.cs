using MovieApp.Data;

namespace MovieApp
{
    public static class DataSeeder
    {
        public static void Seed(this IHost host)
        {
            using var scope = host.Services.CreateScope();
            using var context = scope.ServiceProvider.GetRequiredService<MovieDataContext>();
            context.Database.EnsureCreated();
            AddMovies(context);
        }

        private static void AddMovies(MovieDataContext context)
        {
            var movies = context.Movies.FirstOrDefault();
            if (movies != null) return;

            context.Movies.Add(new Movie
            {
                Title = "The Shawshank Redemption",
                Year =  1994,
                Summary =  "Some text",
                Actors = new List<Actor> 
                {
                new Actor { FullName = "Morgan Freeeman"},
                new Actor { FullName = "Tim Robbins"},
                }
            });

            context.Movies.Add(new Movie
            {
                Title = "Matrix",
                Year = 1999,
                Summary = "Some text about matrix",
                Actors = new List<Actor>
                {
                new Actor { FullName = "Keanu Reeves"},
                
                }
            });


            context.SaveChanges();
        }
    }

}
