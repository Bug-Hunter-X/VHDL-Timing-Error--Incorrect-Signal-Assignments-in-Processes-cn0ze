In VHDL, a common yet subtle error involves incorrect handling of signal assignments within processes.  Consider this example:
```vhdl
process (clk)
begin
  if rising_edge(clk) then
    if condition1 then
      signal1 <= '1';
    else
      signal1 <= '0';
    end if;
  end if;
end process;
```
This code seems straightforward, but if `condition1` is a complex expression or involves other signals that change within the same clock cycle, the assignment to `signal1` might not take effect immediately.  The problem arises because the signal assignment is scheduled, not immediately executed.  Changes to `signal1` only become visible in the *next* clock cycle.
Another similar issue involves using signals as variables inside processes, which can also cause unexpected behavior if not handled with care. Using a signal assignment in the process as shown above instead of variable assignment will also lead to a timing error.