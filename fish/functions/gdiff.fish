function gdiff
  git log --graph --pretty=format:'%Cred%h%Creset - %s %Creset' --abbrev-commit origin/$argv[2]..origin/$argv[1]
end
