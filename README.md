# hyde

![rspec](https://github.com/romkey/hyde/actions/workflows/rspec.yml/badge.svg)
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg)](code_of_conduct.md)

hyde is a Ruby program for managing draft posts on Jekyll

## Usage

```
hyde draft [--paste] "Draft Article Title"

hyde rm FILENAME

hyde publish FILENAME
```



### draft "TITLE"

```
Usage:
  hyde draft TITLE

Options:
  [--paste], [--no-paste]
                           # Default: true
```



### rm filename

```
Usage:
  hyde rm FILE
```

Removes the draft post and its images

#### publish filename

```
Usage:
  hyde publish FILE

Options:
  [--commit], [--no-commit]
                             # Default: true
  [--push], [--no-push]
  [--deploy], [--no-deploy]
```

Moves the draft post to _posts, moves its images, rewrites the post, publishing it.

## Hyde article model

A post has a header image and a teaser image. The header image is
at the top of the post's page; the teaser is a smaller version of
the header used when generating an archive or index of posts.

### Drafts

Hyde stores draft posts in the `_drafts` folder. Posts are named
using a simplified, lower case version of the title.

Draft images are stored in `assets/images/drafts/` in a folder using
the same simplified version of the post's title.

### Published Posts

Hyde stores publishes posts in the `_posts` folder.

If Hyde publishes a post on 10/14/2022, the post would be stored in `_posts/2022-10-14-title.md`.

Hyde would also create a directory in `assets/images/2022/10/14/title/`  which would contain the header and teaser images used by the article as well as any other images it contained.
