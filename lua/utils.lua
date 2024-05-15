local M = {}

function M.contains(array, item)
	for _, value in pairs(array) do
		if value == item then
			return true
		end
	end

	return false
end

return M
