# reveal-talk

Build markup talks with [reveal.js](https://revealjs.com/).

This project is a useful starting point to creating quick presentations in markdown, that you can then present from your browser.

## Usage

The repo provides scripts and sample content for a talk.

It checks out a copy of reveal.js, populates it with your content, and allows you to run it.

### Single File

If all you have is a single markdown file, you can set it up as follows:

1. `git clone https://github.com/mlrdevgit/reveal-talk`
2. `build-talk.cmd YOUR-MARKDOWN-FILE`. This requires `git` and `npm` to be accessible on your path.

That's it. The first top-level header will be used as your presentation name in the browser title.

You can use `content/talk.md` as a starting point for your presentation.

### Multiple Files

If you work with multiple files, there is a built-in flow to help you create your presentation.

1. `git clone https://github.com/mlrdevgit/reveal-talk`
2. `build-talk.cmd`. This requires `git` and `npm` to be accessible on your path.
3. You can edit the files under reveal.js, then update with `copy-to-content.cmd`.
4. The files that are copied back and forth are in `content-files.txt`.
5. Commit any changes after copying under `content` - those make up your talk.

It's easiest if you keep the files in a clone of this repo, but you can point `build-talk.cmd` to any directory of your choice as well for content files.

For much more information on how to edit your presentation, including adding notes and customizing presentation, see [reveal.js](https://github.com/hakimel/reveal.js.git).

## License

MIT License - [LICENSE](LICENSE).

## References

- https://revealjs.com/
- Posts on [Emacs](http://lopezruiz.net/tags/emacs.htm) and living life in [plaintext](http://lopezruiz.net/2020/03/25-tools-for-plaintext-specs.htm).
