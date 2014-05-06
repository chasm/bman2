User.destroy_all
Post.destroy_all
Tag.destroy_all

user = User.create( name: "Chas", email: "chas@munat.com" )

tags = Tag.create([
  { name: "red" },
  { name: "green" },
  { name: "blue" }
])

article = Article.create(
  title: "Jabberwock",
  body: "'Twas brillig, and the slithy toves/Did gyre and gimble in the wabe:/All mimsy were the borogoves,/And the mome raths outgrabe.",
  user: user,
  tags: tags
)

comments = Comment.create([
  {
    body: "Shun the frumious Bandersnatch!",
    post: article,
    user: user
  },
  {
    body: "And through and through the vorpal blade went snicker-snack!",
    post: article,
    user: user
  },
  {
    body: "The Jabberwock, with eyes of flame, came whiffling through the tulgey wood.",
    post: article,
    user: user
  }
])

replies = Comment.create([
  {
    body: "And, has thou slain the Jabberwock?",
    post: comments[0],
    user: user
  }
])
