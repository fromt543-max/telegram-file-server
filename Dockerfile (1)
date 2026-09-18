# Service ថ្មីនេះ ដាច់ដោយឡែកទាំងស្រុងពី Service telegram-bot ចាស់ និង my-life-rpg-bot —
# មិនប៉ះពាល់អ្វីទាំងពីរនោះទេ។ វា Run ទាំង telegram-bot-api (--local) និង File Server
# តូចមួយ ដើម្បីឲ្យ bot.py អាច Download File ធំៗបាន តាម HTTP ឆ្លងកាត់ Container ។

FROM aiogram/telegram-bot-api:latest AS botapi

FROM python:3.12-alpine

COPY --from=botapi /usr/local/bin/telegram-bot-api /usr/local/bin/telegram-bot-api
RUN mkdir -p /var/lib/telegram-bot-api

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
