## Github

**Objectives: collaborate pushing to common repo**

1. Pair up students, one will be `owner` and another `collaborator`
1. In your planets repo on GitHub, click settings, select collaborators, enter partner's git username
1. Partner should `cd` to another directory (Desktop) and make copy of partner's repo: 
   * `cd ~/Desktop`
  ~~~
   git clone https://github.com/vlad/planets.git (replace vlad with your partner's name)
  ~~~
1. collaborator should make changes, add, commit, git push origin master
1. original owner can pull changes onto their machine


## conflicts 

each partner adds a (different) line to mars.txt, adds, commits, pushes to github
the second push will fail
failed pusher should:
git pull origin master
reconcile change and remove markers (you can accept the remote or local changes or add something else)
git add, status, commit, push
other partner can pull without additional changes needing to take place

Collaboration Exercise
collaboration tool: https://github.com/jt14den/git-collaboration
students can fork the repo
explain forking: making own copy of a repo that isn't owned by you
make changes to one of the countries
submit pull request to original owner
