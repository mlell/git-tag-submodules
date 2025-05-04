# git-tag-submodules

Copy a tag to all submodules of the current repository.

## Usage

```bash
git tag my-tag
tag-submodule my-tag   # copy to all submodules
tag-submodule my-tag my_folder   # copy to all submodules within my_folder
```

## Installation

Copy the script to a folder in your PATH. Perl needs to be installed but
no additional packages except the File::Spec module.

## Options

```
  Usage: tag-submodule [OPTIONS] [--] tag-name [PATH...]
  
  OPTIONS:
    -a      Copy tag to active submodules only. Without this option,
            encountering a submodule that is not active will cause an error.
    
    -s, -u <keyid>
            Sign tags with the default GPG key (-s) or the specified key (-u).
            Uses the options of the same name in "git tag".

    -f      Overwrite existing tags in submodules. Use "git tag -f".
    
    -h, --help
            Display this usage information

    -q, --quiet
            Do not print status messages
  
    --      Declare end of option arguments, remaining arguments are treated
            as positional (e.g. use if the tag name starts with dashes)

  POSITIONAL ARGUMENTS:
    tag-name
             The tag name to use for the submodule commits
    PATH
             The path to the submodule directories. If not specified, the
             current directory is used.
   
   EXAMPLES:
     tag-submodule my_tag            # Copy this tag to all submodules
     tag-submodule my_tag my_folder/ # Copy only to submodules below my_folder/
  
   ENVIRONMENT VARIABLES:
     DEBUG    If set to "true" or "TRUE", print debug messages
```

