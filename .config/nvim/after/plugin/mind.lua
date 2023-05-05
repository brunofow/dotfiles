local mind = require('mind')

local is_open = false

function ToggleMain()
  if(is_open)
  then
    mind.close()
    is_open = false
  else
    mind.open_main()
    is_open = true
  end
end

vim.keymap.set("n", "<leader>m", ToggleMain)

mind.setup()
