require('luasnip.session.snippet_collection').clear_snippets('c')
local s = require('luasnip').snippet
local i = require('luasnip').insert_node
local fmt = require('luasnip.extras.fmt').fmt

require('luasnip').add_snippets('c', {
    s('main', fmt([[
        #include <stdio.h>
        #include <stdlib.h>

        int main(int argc, char** argv) {{
            {}
            return 0;
        }}
    ]], i(0))),
})
