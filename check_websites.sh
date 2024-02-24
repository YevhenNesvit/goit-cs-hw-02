#!/bin/bash

# Список вебсайтів для перевірки
websites=("https://google.com" "https://facebook.com" "https://twitter.com")

# Файл логів
log_file="website_status.log"

# Очищення файлу логів перед записом нових результатів
> "$log_file"

# Цикл для перевірки кожного вебсайту
for site in "${websites[@]}";
do
    # Виконання HTTP GET запиту до вебсайту за допомогою curl і отримання HTTP статус-коду
    if curl -s -L --head --request GET -w "%{http_code}" "$site" | grep "200" > /dev/null

    # Перевірка HTTP статус-коду
    then
        # Вебсайт доступний
        echo "$site is UP" >> "$log_file"
    else
        # Вебсайт недоступний
        echo "$site is DOWN" >> "$log_file"
    fi
done

# Виведення повідомлення про завершення та шляху до файлу логів
echo "Результати записано у файл логів: $log_file"