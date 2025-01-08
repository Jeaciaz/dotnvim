local ok, autotag = pcall(require, 'nvim-ts-autotag')
if not ok then
    echo 'Autotag not found'
    return
end

autotag.setup {
  opts = {
    enable_close = true,
    enable_rename = true,
    enable_close_on_slash = true,
  }
}
