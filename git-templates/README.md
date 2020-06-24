# init templatedir

## usage
``` sh
ln -s dir_to_git-gemplates ~/.git-gemplates
git config --global init.templatedir ~/.git-templates
git config --global commit.template ~/.git-templates/.gitmessage.txt
```

## brief
+ pre-commit   
  use clang-format to format the c, c++ code.
+ commit-msg   
  Add commit type check.  
+ .clang-format   
  The clang-format setting.
+ .git-clone-init    
  Clone use different name and email setting according to the code repo address.
+ .gitignore   
  The globale ignore git setting.
+ .gitmessage.txt   
  Git commit message setting.



