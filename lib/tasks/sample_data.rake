namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		make_leave_types
		make_user_type
		make_all_users
	end

	def make_leave_types
		LeaveType.create(name: "Leave Type 01", cost: 0.0)
		LeaveType.create(name: "Leave Type 02", cost: 0.5)
		LeaveType.create(name: "Leave Type 03", cost: 1.0)
		LeaveType.create(name: "Leave Type 04", cost: 2.0)
	end

	def make_user_type
		UserType.create(name: "Admin")
		UserType.create(name: "Manager")
		UserType.create(name: "Normal")
	end

	def make_all_users
		make_admin_user
		make_manager_user
		make_normal_user
	end

	def make_admin_user
		admin = User.new(first_name: "TPL", last_name: "Admin", email: "admin@dev.com", balance: 5.0, user_type_id: 1)
		admin.toggle!(:admin)
		admin.save
	end

	def make_manager_user
		1.upto(4) do |i|
			User.create(first_name: "", last_name: "Manager#{i}", email: "manager#{i}@dev.com", balance: 2.0, user_type_id: 2)
		end
	end

	def make_normal_user
		1.upto(20) do |i|
			User.create(first_name: "", last_name: "User#{i}", email: "user#{i}@dev.com", balance: 2.0, user_type_id: 3)
		end
	end
end