# ebook-editor

## Premise

Epub (`.epub`) documents sometimes render strangely on Kindle.

### For example

| Original Character | Rendered String | Desired Character |
| ------------------ | ---------------- | ------------- |
| apostrophe (`’`) | `â€™` | `'` |
| left quote (`“`) | `â€œ` | `"` |
| right quote (`”`) | `,â€` | `"` |
| hyphen (`—`) | `â€"` | `-` |
| No-Break Space (` `) | `Â ` | ` ` |

## Strategy
1. Take `epub` file
2. Convert `epub` file to zip file
3. Un-zip new `zip` file
4. Open all `xhtml` file in unzipped directory
5. Replace all instances of original character with desired character
6. Re-zip directory to `zip` file
7. Convert `zip` file to `epub`


## Note

When running in git-bash, the `zip` command might not be installed on your machine.  Download here

- [zip](https://sourceforge.net/projects/gnuwin32/files/zip/3.0/zip-3.0-bin.zip/download)
- [bzip2](https://sourceforge.net/projects/gnuwin32/files/bzip2/1.0.5/)

[_More details_](https://ranxing.wordpress.com/2016/12/13/add-zip-into-git-bash-on-windows/#:~:text=While%20using%20git%2Dbash%2C%20you,you%20can%20get%20from%20gnuwin32.)