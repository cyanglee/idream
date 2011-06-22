# Read about factories at http://github.com/thoughtbot/factory_girl
Factory.define :user do |f|
    f.email "cyoung.lee@gmail.com"
    f.password "123456"
    f.password_confirmation "123456"
    f.admin 1
end