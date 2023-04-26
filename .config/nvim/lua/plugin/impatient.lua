local status_ok, impatient = pcall(require, "impatient")
if not status_ok then
	return
end

require("impatient").enable_profile()
