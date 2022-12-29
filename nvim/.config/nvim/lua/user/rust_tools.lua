local status_ok, rt = pcall(require, "rust-tools")
if not status_ok then
	return
end

rt.setup({})
