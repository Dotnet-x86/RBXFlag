# Flag Library for Roblox

## Overview

`Flag` is a flexible library for handling flag-based systems in Roblox. It allows you to define, manage, and manipulate flags using integers, which are highly efficient for storage and performance. The library uses `bit32` to store multiple flags within a single integer, allowing compact and efficient flag management. You can toggle, check, and manage the states of flags using bitwise operations, making it ideal for performance-critical systems.

This library is useful for handling a variety of use cases, such as managing multiple boolean attributes or states in a compact manner, and it's especially efficient for systems where managing a large number of boolean states is necessary.

## Features

- **Compact Storage**: Flags are stored in a single integer using `bit32` bitwise operations, which allows for efficient storage and performance.
- **Easy Flag Management**: Supports toggling, checking, and clearing flags.
- **Custom Flag Definitions**: Allows you to define your own flags and their corresponding boolean values.
- **Efficient Flag Operations**: Uses `bit32` for bitwise operations to manage multiple flags with a single integer.
- **Compatibility**: Works well with Roblox games and can be used in a variety of scenarios where boolean states are required.

## Usage

### Create a Flag Instance

You can create a `Flag` instance by passing a table of flag definitions.

```lua
local myFlag = Flag.new({
    IsJumping = false,
    IsRunning = false
})
```
Check Multiple Flags
You can check if multiple flags are active at once:

```lua
if myFlag:HasFlags("IsJumping", "IsRunning") then
    print("The player is both jumping and running!")
else
    print("The player is not jumping and running at the same time!")
end
```

Check a Single Flag with Is
You can check if a single flag is active using the Is function:
```lua
if myFlag:Is("IsRunning") then
    print("The player is running!")
end
```
Toggle Flags
You can toggle the value of a flag:

```lua
myFlag:Toggle("IsRunning")
```
Clear All Flags
You can reset all flags to false using the Clear function:

```lua
myFlag:Clear()
```
Set Multiple Flags
You can set multiple flags at once:

```lua
myFlag:SetFlags({
    IsJumping = true,
    IsRunning = true
})
```
Get Active Flags
To retrieve a list of all active flags:

```lua
local activeFlags = myFlag:GetActiveFlags()
for _, flag in ipairs(activeFlags) do
    print(flag)
end
```
To get the Bitmask Integer that represents the current flag state, you can use the __len method:
```lua
local bitmask = #myFlag  -- Get the bitmask integer representing the current state of flags
print(bitmask)  -- Outputs the bitmask integer
```
Example of Flag Usage with Integer
You can also load the flag state from an integer:
```lua
myFlag(7) or myFlag(#anotherFlag) -- Loads the flag state based on the integer value.

```
## API Documentation

- **HasFlags(...: string):**  
  Checks if all the flags with the given names are active.  
  Returns `true` only if all specified flags are active, otherwise `false`.

- **Is(name: string):**
  Checks if the specified flag is active.
  Returns true if the flag is active, otherwise false.

- **IsEmpty():**  
  Checks if no flags are active.  
  Returns `true` if no flags are active, otherwise `false`.

- **Toggle(name: string):**  
  Toggles the value of the specified flag.  
  If the flag is active, it becomes inactive; if it's inactive, it becomes active.

- **Clear():**  
  Resets all flags to `false`.  
  This will clear all the flags and set them to inactive.

- **SetFlags(flags: table):**  
  Sets multiple flags at once.  
  Takes a table where each key is the flag name and the value is a boolean (`true` or `false`) indicating the desired state.

- **GetActiveFlags():**  
  Returns a list of all active flags.  
  This will return a table of flag names that are currently active.

- **__call(int: number):**  
  Sets the flag state based on the provided integer value.  
  If the integer corresponds to a valid state, it updates the flags accordingly. If not, a warning is shown.
  
- **__len():**
  Returns the bitmask integer representing the current state of all flags.
  This is useful for retrieving and storing the flag states in a compact form.

## License
This library is open-source and licensed under the MIT License.
