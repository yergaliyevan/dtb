-- task 1
create function increase_value(input_value int) returns int as $$
begin
    return input_value + 10;
end;
$$ language plpgsql;
-- task 2
create function compare_numbers(num1 int, num2 int) returns text as $$
begin
    if num1 > num2 then
        return 'greater';
    elseif num1 = num2 then
        return 'equal';
    else
        return 'lesser';
    end if;
end;
$$ language plpgsql;
-- task 3
create function number_series(n int) returns text as $$
declare
    series text := '';
    i int := 1;
begin
    while i <= n loop
        series := series || i || case when i < n then ',' else '' end;
        i := i + 1;
    end loop;
    return series;
end;
$$ language plpgsql;
-- task 4
create function find_employee(employee_name varchar) returns table(id int, name varchar, salary int) as $$
begin
    return query select * from employees where name = employee_name;
end;
$$ language plpgsql;
-- task 5
create function list_products(category_name varchar) returns table(id int, name varchar, price numeric) as $$
begin
    return query select * from products where category = category_name;
end;
$$ language plpgsql;
-- task 6
create function calculate_bonus(salary int) returns numeric as $$
begin
    return salary * 0.10;
end;
$$ language plpgsql;

create function update_salary(employee_id int) returns void as $$
declare
    current_salary int;
    bonus numeric;
begin
    select salary into current_salary from employees where id = employee_id;
    bonus := calculate_bonus(current_salary);
    update employees set salary = current_salary + bonus where id = employee_id;
end;
$$ language plpgsql;

-- task 7
create  function complex_calculation(input_number int, input_string varchar) returns text as $$
declare
    numeric_result int;
    string_result varchar;
begin
    numeric_result := input_number * 2;
    string_result := 'processed: ' || input_string;
    return string_result || ' | numeric result: ' || numeric_result;
end;
$$ language plpgsql;