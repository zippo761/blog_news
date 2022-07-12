module UsersHelper
  # TODO: костыль, но пока так
  def map_subscription_name(key)
    name_map = {
      'no' => 'Отключена',
      'daily' => 'Ежедневная',
      'weekly' => 'Еженедельная'
    }

    name_map[key]
  end
end
