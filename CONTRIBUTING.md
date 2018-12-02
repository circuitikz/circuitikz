# Contributing

When contributing to this repository, please first discuss the change you wish to make via issue,
email, or any other method with the owners of this repository before making a change. 

Although this project has no official Code of Conduct, we ask you to be kind, and respectful in your comments and request. 
Remember that this is an effort from a group of volunteers, so be patient... 

# Preferred way of contributing

If you'd like to contribute changes, enhancement an bug-fixes, you are welcome to do so! The preferred way is a pull request (see https://help.github.com/articles/about-pull-requests/), which is the best way to preserve authorship (see appendix 2) . 

The pull request should:

* be based on the `master` branch of the `circuitikz` repository;
* have a text explaining the content of the request clearly;
* be specific: please avoid a big pull request touching a lot of different places and with a lot of different objectives; that would make the history unclear; 
* if the pull request is an enhancement, it should add the correspondent info to the manual (`circuitikzmanual.tex` in the `doc` directory); please check that it compiles correctly against your changes (see appendix 1).

# Other way of contributing

Just open an issue. We will try to help you the best we can. 

# Troubleshooting 

Again, just open an issue. But another way of finding answer is to ask a [good question](https://tex.meta.stackexchange.com/questions/1436/welcome-to-tex-sx) on [TeX-LaTeX stack exchange](https://tex.stackexchange.com/questions) using the `circuitikz` tag. 

## Appendix 1: compile the manual

To compile your manual against your version/fork of `circuitikz` you can use `make manual` in the root directory; this needs `pandoc` to be installed, and will run twice in order to completely generate the document cross-references. 

To rapidly compile just once, at least in Linux computers, you can use

    TEXINPUTS=.:../tex/: xelatex -8bit compatibility.tex;\
    TEXINPUTS=.:../tex/: xelatex -8bit circuitikzmanual.tex;

...please adapt it for your OS. 

## Appendix 2: minimal git workflow 

The best way to start learning GIT is reading [Pro GIT](https://git-scm.com/book/en/v2), a really nice book about it. 
But basically, a possible workflow is: 


1) fork the repo in your github account and clone it locally.

2) go to the clone and setup the upstream reference:

        git remote add upstream  https://github.com/original/original.git

3) to keep the repo synced:

        git checkout master
        git fetch upstream
        #... check
        git merge upstream/master

4) to contribute create a local branch and push it

        git checkout -b mybranch
        
5) code code code... if while you are coding, the master changes, then do step 3 to keep in sync, and rebase your branch before pushing it with `git checkout -b branch; git rebase master`, and continue.

6) push it on your repo:

        git push -u origin mybranch

7) go to the `circuitikz` github page (the main one) and now you can generate the pull request

8) after/if the pull is accepted, *optionally* tidy up removing branches

        git branch -d mybranch
        git push --delete origin mybranch

