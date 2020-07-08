# init templatedir

## 1 usage
``` sh
ln -s dir_to_git_template ~/.git_template
ln -s dir_to_git_template/.git-clone-init ~/.git-clone-init
ln -s dir_to_git_template/.gitconfig ~/.gitconfig
git config --global init.templatedir ~/.git_template
git config --global commit.template ~/.git_templates/.gitmessage.txt
```

## 2 brief
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



