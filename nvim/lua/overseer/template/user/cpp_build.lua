return {
  name = "Build C++",
  builder = function()
    local file_name = vim.fn.expand("%")
    local output_dir = "./bin"
    vim.fn.mkdir(output_dir, "p")
    return {
      cmd = { "clang++" },
      args = { "-g", "-Wall", "-Wextra", file_name, "-o", output_dir .. "/" .. file_name:gsub(".cpp", "") },
      components = { { "on_output_quickfix", open = true }, "default" },
    }
  end,
  condition = {
    filetype = { "cpp" },
  },
}
