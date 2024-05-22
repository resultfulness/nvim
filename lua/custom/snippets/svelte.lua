require('luasnip.session.snippet_collection').clear_snippets('svelte')
local s = require('luasnip').snippet
local i = require('luasnip').insert_node
local fmt = require('luasnip.extras.fmt').fmt

require('luasnip').add_snippets('svelte', {
    s('sts', fmt([[<script lang="ts">{}</script>]], i(0)))
})
