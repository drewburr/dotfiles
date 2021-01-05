# browndr-dotfiles

My personal dotfiles. Currently this is setup to support Bash, as is expecting on MacOS. Most features are likely to work identically on alternate shells/platforms, but I can almost guarentee there will be some initial compatibility issues.

## Setup

To utilize this entire repository, clone and move the repository to `~/Source`. Afterwards, you'll want to append the below script to your `~/.bashrc` file.

```bash
# For every item at the root of ~/Source
for item in $(find ~/Source -name "*.sh" -d 1); do
        # Source it
        source $item
done
```
