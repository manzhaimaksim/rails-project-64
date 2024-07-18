# frozen_string_literal: true

Category.destroy_all

categories = ['Antropology', 'Earth Science', 'Engineering', 'Marketing', 'Materials Science', 'Physics',
              'Political Science', 'Public Policy', 'Sociology']

categories.each { |category| Category.create(name: category) }
