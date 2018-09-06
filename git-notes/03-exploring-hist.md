### Exploring History

If we want to see what we changed when,
we use `git diff` again,
but refer to old versions
using the notation `HEAD~1`, `HEAD~2`, and so on:

~~~ {.bash}
$ git diff HEAD~1 mars.txt
~~~

~~~ {.output}
diff --git a/mars.txt b/mars.txt
index 315bf3a..b36abfd 100644
--- a/mars.txt
+++ b/mars.txt
@@ -1,2 +1,3 @@
 Cold and dry, but everything is my favorite color
 The two moons may be a problem for Wolfman
+But the Mummy will appreciate the lack of humidity
~~~

~~~ {.bash}
$ git diff HEAD~2 mars.txt
~~~

~~~ {.output}
diff --git a/mars.txt b/mars.txt
index df0654a..b36abfd 100644
--- a/mars.txt
+++ b/mars.txt
@@ -1 +1,3 @@
 Cold and dry, but everything is my favorite color
+The two moons may be a problem for Wolfman
+But the Mummy will appreciate the lack of humidity
~~~

_Useful git diff flags_

* `git diff --stat` gives us a summary of the filename and number of insertions/deletions
* `git diff -- filename` looks at the differences for a specific file

In this way,
we build up a chain of revisions.
The most recent end of the chain is referred to as `HEAD`;
we can refer to previous revisions using the `~` notation,
so `HEAD~1` (pronounced "head minus one")
means "the previous revision",
while `HEAD~123` goes back 123 revisions from where we are now.

We can also refer to revisions using
those long strings of digits and letters
that `git log` displays.
These are unique IDs for the changes,
and "unique" really does mean unique:
every change to any set of files on any machine
has a unique 40-character identifier.
Our first commit was given the ID
f22b25e3233b4645dabd0d81e651fe074bd8e73b,
so let's try this:

~~~ {.bash}
$ git diff f22b25e3233b4645dabd0d81e651fe074bd8e73b mars.txt
~~~

~~~ {.output}
diff --git a/mars.txt b/mars.txt
index df0654a..b36abfd 100644
--- a/mars.txt
+++ b/mars.txt
@@ -1 +1,3 @@
 Cold and dry, but everything is my favorite color
+The two moons may be a problem for Wolfman
+But the Mummy will appreciate the lack of humidity
~~~

That's the right answer,
but typing random 40-character strings is annoying,
so Git lets us use just the first few:

~~~ {.bash}
$ git diff f22b25e mars.txt
~~~

~~~ {.output}
diff --git a/mars.txt b/mars.txt
index df0654a..b36abfd 100644
--- a/mars.txt
+++ b/mars.txt
@@ -1 +1,3 @@
 Cold and dry, but everything is my favorite color
+The two moons may be a problem for Wolfman
+But the Mummy will appreciate the lack of humidity
~~~

### Recovering Old Versions

_So far, this seems like a lot of work. Why are we keeping track of all these little things??
Let's say you fatally ruin a file during an editing mistake
(like when I deleted an awesome paragraph from my dissertation instead of cutting and pasting it like I meant to.)
Maybe you even accidentally delete an important file (This code is old, why should I keep it?).
If you have version control, you don't need to track down your System Administrator. You can fix your problem easily!_

All right:
we can save changes to files and see what we've changed---how
can we restore older versions of things?
Let's suppose we accidentally overwrite our file:

~~~ {.bash}
$ nano mars.txt
$ cat mars.txt
~~~

~~~ {.output}
We will need to manufacture our own oxygen
~~~

`git status` now tells us that the file has been changed,
but those changes haven't been staged:

~~~ {.bash}
$ git status
~~~

~~~ {.output}
# On branch master
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	modified:   mars.txt
#
no changes added to commit (use "git add" and/or "git commit -a")
~~~

We can put things back the way they were
by using `git checkout`:

~~~ {.bash}
$ git checkout HEAD mars.txt
$ cat mars.txt
~~~

~~~ {.output}
Cold and dry, but everything is my favorite color
The two moons may be a problem for Wolfman
But the Mummy will appreciate the lack of humidity
~~~

As you might guess from its name,
`git checkout` checks out (i.e., restores) an old version of a file.
In this case,
we're telling Git that we want to recover the version of the file recorded in `HEAD`,
which is the last saved revision.

_This would work even if we deleted our file, and wanted to get it back!_
_delete mars.txt, and then show that it can be checked back out_

If we want to go back even further,
we can use a revision identifier instead:

~~~ {.bash}
$ git checkout f22b25e mars.txt
~~~

It's important to remember that
we must use the revision number that identifies the state of the repository
*before* the change we're trying to undo.
A common mistake is to use the revision number of
the commit in which we made the change we're trying to get rid of.
In the example below, we want retrieve the state from before the most
recent commit (`HEAD~1`), which is revision `f22b25e`:

<img src="img/git-checkout.svg" alt="Git Checkout" />

The following diagram illustrates what the history of a file might look
like (moving back from `HEAD`, the most recently committed version):

<img src="img/git-when-revisions-updated.svg" alt="When Git Updates Revision Numbers" />

> #### Simplifying the Common Case
>
> If you read the output of `git status` carefully,
> you'll see that it includes this hint:
>
> ~~~ {.bash}
> (use "git checkout -- <file>..." to discard changes in working directory)
> ~~~
>
> As it says,
> `git checkout` without a version identifier restores files to the state saved in `HEAD`.
> The double dash `--` is needed to separate the names of the files being recovered
> from the command itself:
> without it,
> Git would try to use the name of the file as the revision identifier.

The fact that files can be reverted one by one
tends to change the way people organize their work.
If everything is in one large document,
it's hard (but not impossible) to undo changes to the introduction
without also undoing changes made later to the conclusion.
If the introduction and conclusion are stored in separate files,
on the other hand,
moving backward and forward in time becomes much easier.
Or for your code, if you store functions in files separate from code that executes them, or makes figures,
you can go back in time to find or retrieve specific chunks.

### Ignoring Things

What if we have files that we do not want Git to track for us,
like backup files created by our editor
or intermediate files created during data analysis.

_while git can keep track of data files, this is often not a great idea.
Share story of .rdata files in collaborative project. Why they needed to be in the .git ignore file_

Let's create a few dummy files:

~~~ {.bash}
$ mkdir results
$ touch a.dat b.dat c.dat results/a.out results/b.out
~~~

and see what Git says:

~~~ {.bash}
$ git status
~~~

~~~ {.output}
# On branch master
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	a.dat
#	b.dat
#	c.dat
#	results/
nothing added to commit but untracked files present (use "git add" to track)
~~~

_Note: if you already added these files (git add .) you can unstage them by typing git reset HEAD_

Putting these files under version control would be a waste of disk space.
What's worse,
having them all listed could distract us from changes that actually matter,
so let's tell Git to ignore them.

We do this by creating a file in the root directory of our project called `.gitignore`.

~~~ {.bash}
$ nano .gitignore
$ cat .gitignore
~~~

~~~ {.output}
*.dat
results/
~~~

These patterns tell Git to ignore any file whose name ends in `.dat`
and everything in the `results` directory.
(If any of these files were already being tracked,
Git would continue to track them.)

Once we have created this file,
the output of `git status` is much cleaner:

~~~ {.bash}
$ git status
~~~

~~~ {.output}
# On branch master
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	.gitignore
nothing added to commit but untracked files present (use "git add" to track)
~~~

The only thing Git notices now is the newly-created `.gitignore` file.
You might think we wouldn't want to track it,
but everyone we're sharing our repository with will probably want to ignore
the same things that we're ignoring.
Let's add and commit `.gitignore`:

~~~ {.bash}
$ git add .gitignore
$ git commit -m "Add the ignore file"
$ git status
~~~

~~~ {.output}
# On branch master
nothing to commit, working directory clean
~~~

As a bonus,
using `.gitignore` helps us avoid accidentally adding files to the repository that we don't want.

~~~ {.bash}
$ git add a.dat
~~~

~~~ {.output}
The following paths are ignored by one of your .gitignore files:
a.dat
Use -f if you really want to add them.
fatal: no files added
~~~

If we really want to override our ignore settings,
we can use `git add -f` to force Git to add something.
We can also always see the status of ignored files if we want:

~~~ {.bash}
$ git status --ignored
~~~

~~~ {.output}
# On branch master
# Ignored files:
#  (use "git add -f <file>..." to include in what will be committed)
#
#        a.dat
#        b.dat
#        c.dat
#        results/

nothing to commit, working directory clean
~~~

_To discard all your most recent changes and GO BACK IN TIME,
first look at your `git log` to decide what version you want to go back to.
Remember the first 5-7 digits in the commit code of the version that wasn't screwed up._

_use `git reset --hard versioncode`_

_To roll back to a specific file, use
`git checkout version name --filename`_

_To roll back one version (usually I know that I messed up pretty quickly)
`git checkout master~1 PathToFile`_


_A short exercise to show moving back and forth. If I mess up and I notice right away,
 might want to go back in time quickly. Commit some changes to `mars.txt`.
 I can return to the previous version by typing `git checkout master~1 mars.txt`, and then
 committing those changes with a message like "I deleted the thing I just added".
 This will preserve your entire history, including the short-lived mistake, which will allow
 you to return to it if you should decide it wasn't a mistake at all.
 If you check out the entire repository using `git checkout master~1` you will be in
 "detached head state". This can be quickly remedied by typing `git checkout master`, to return
 you to the correct place. Detached head is when the head is not the same version as the master._


> ### Key Points {.objectives}
>
> *   Use `git config` to configure a user name, email address, editor, and other preferences once per machine.
> *   `git init` initializes a repository.
> *   `git status` shows the status of a repository.
> *   Files can be stored in a project's working directory (which users see),
>     the staging area (where the next commit is being built up)
>     and the local repository (where snapshots are permanently recorded).
> *   `git add` puts files in the staging area.
> *   `git commit` creates a snapshot of the staging area in the local repository.
> *   Always write a log message when committing changes.
> *   `git diff` displays differences between revisions.
> *   `git checkout` recovers old versions of files.
> *   The `.gitignore` file tells Git what files to ignore.

> ### Challenge {.challange}
>
> Create a new Git repository on your computer called `bio`.
> Write a three-line biography for yourself in a file called `me.txt`,
> commit your changes,
> then modify one line and add a fourth and display the differences
> between its updated state and its original state.

> ### Challenge {.challenge}
>
> The following sequence of commands creates one Git repository inside another:
>
> ~~~ {.bash}
> cd           # return to home directory
> mkdir alpha  # make a new directory alpha
> cd alpha     # go into alpha
> git init     # make the alpha directory a Git repository
> mkdir beta   # make a sub-directory alpha/beta
> cd beta      # go into alpha/beta
> git init     # make the beta sub-directory a Git repository
> ~~~
>
>
> Why is it a bad idea to do this?
