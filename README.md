# geo
ror backend to support geo data CURD

# Dev Logs
I like to write daily logs!

## 2024-08-15
Fresh new start, haven't touch rails/ruby for a long time, kinda miss the joy writing ruby codes. No matter what, ruby is the first language I picked up in my programming road path.

First thing first, setups
- [x] init project
- [x] init git
- [x] init db
- [x] setup docker
- [x] rspec

WOW, rails 7 and ruby 3! Still remember first time started a rails project, I was using rails 4 and ruby 1.x. How time flies.

Luckily I still have ruby/rails installed in my wsl, but not sure why when I init the project, I'm seeing this:
> Ignoring nokogiri-1.15.5 because its extensions are not built. Try: gem pristine nokogiri --version 1.15.5
Ignoring nokogiri-1.10.10 because its extensions are not built. Try: gem pristine nokogiri --version 1.10.10

might because I haven't used it for a long time.
gpt told me to run
> gem pristine nokogiri --version 1.10.10

to fix the issue, and it works

***P.S.***
Talking about AI and chatgpt, it's a grate tool to use, pretty much replaced google search. Our human brains have memory limits, and it erased unimportant stuff by nature.

### DB
I looked up geo data format, did not see any strong relations exists, so I plan to use mongodb to store the data.
For convenience, I just gonna use docker and docker-compose for a mongodb service
Also, using mongoid means I don't need to use active record.

### Rspec
TDD is common approach in rails. Remember when I first learning rails, every books/tutorials/blogs using TDD. However, late when I work as a developer, I always write test last, because of the tight schedule.

Setup rspec with mongoid-rspec gem and mongoid is straightforward. Only thing I noticed is that rspec is using ruby 2.7 right now.

Pretty much setup everything today, let's call it a night
