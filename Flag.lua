export type Flag <F> = {
	HasFlag: (self: Flag<F>, name: string) -> boolean,
	IsEmpty: (self: Flag<F>) -> boolean,
	Toggle: (self: Flag<F>) -> (),
	Clear: (self: Flag<F>) -> (),
	GetActiveFlags: (self: Flag<F>) -> {string}
} & F

-- Flag.new ({Some = false})
function Flag <F> (definations: F)
	local flag = {}
	local PropertyList = {}
	local Definations = {}
	local State = {}
	local metadata = {}

	local FLAG_INT = 0
	export type StringName = keyof<F>

	function flag:HasFlags (...: StringName) : boolean
		local self: Flag = self
		
		local has_all = true
		
		for _, name in ipairs({...}) do
			if not self[name] then
				has_all = false
				break
			end
		end
		
		return has_all
	end
	
	function flag:Is (name: StringName) : boolean
		local self: Flag = self
		return self:HasFlags(name)
	end

	function flag:IsEmpty () : boolean
		local self: Flag = self
		return FLAG_INT == 0
	end

	function flag:Toggle (name: StringName) : ()
		local self: Flag = self

		self[name] = not self[name]
	end

	function flag:Clear () : ()
		local self: Flag = self

		FLAG_INT = 0
		for key in pairs(metadata) do
			metadata[key] = false
		end
	end
	
	function flag:SetFlags (flags: {[StringName]: boolean}, overwrite: boolean?) : ()
		local self: Flag = self


		if typeof(flags) == 'table' then
			if typeof(overwrite) == 'boolean' then
				for name in pairs(flags) do
					self[name] = overwrite
				end
			else
				for name, bool in pairs(flags) do
					if typeof(bool) == 'boolean' then
						self[name] = bool
					end
				end
			end
			
		end
	end

	function flag:GetActiveFlags () : {string}
		local self: Flag = self

		local active = {}
		for key in pairs(metadata) do
			if self[key] then
				table.insert(active, key)
			end
		end

		return active
	end

	export type Flag = typeof(flag)

	local i = 0

	for name, bool in pairs(definations) do
		if not Definations[name] then
			local value_type = typeof(bool)
			PropertyList[name] = true
			metadata[name] = value_type == 'boolean' and bool or false
			Definations[name] = bit32.lshift(1, i)
			i += 1
		end
	end

	local total_state = 2^i - 1

	for i = 0, total_state do
		State[i] = true
	end
	
	for name in pairs(flag) do
		PropertyList[name] = true
	end

	local Flag: Flag & F = setmetatable({}, {
		__index = function(self, key: string)
			if PropertyList[key] then
				local bit = Definations[key]

				return bit and bit32.band(FLAG_INT, bit) ~= 0 or flag[key]
			end
			
			error(('%s is not a valid member of %s'):format(key, tostring(self)))
		end,

		__newindex = function(self, key: string, value: boolean)
			if PropertyList[key] then
				if typeof(value) == 'boolean' then
					local bit = Definations[key]
					if value == true then
						FLAG_INT = bit32.bor(FLAG_INT, bit)
					else
						FLAG_INT = bit32.band(FLAG_INT, bit32.bnot(bit))
					end

					metadata[key] = value

				else
					error(('Invalid value type for %s, expected boolean.'):format(key))
				end

			else

				error(('%s is not a valid member of %s'):format(key, tostring(self)))
			end

		end,

		__tostring = function()
			return ('Flag<%d>'):format(FLAG_INT)
		end,

		-- use this for export #Flag -> number
		__len = function()
			return FLAG_INT
		end,

		__eq = function(self: Flag, other: Flag)
			return #self == #other and table.concat(self:GetActiveFlags()) == table.concat(other:GetActiveFlags())
		end,
		
		-- Loads the flag's state from the provided integer. 
		-- If the integer is valid, updates the flag's state; otherwise, warns with valid range.
		__call = function(self, int: number)
			if typeof(int) == 'number' then
				if State[int] then
					FLAG_INT = int
					for key in pairs(Definations) do
						metadata[key] = self[key]
					end
					
				else
					warn(('The provided integer value %d is not a valid state or out of range. Valid range is from 0 to %d. Please provide a valid state.'):format(int, total_state))
				end
			end
		end,

		-- this will return flags data like {someFlag = false, Second = true}
		-- use this to send data via RBXSignal
		__metatable = metadata
	})
	
	for name, bool in pairs(metadata) do
		Flag[name] = bool or false
	end
	
	return Flag
end

return {
	new = Flag,
	
}