import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/extensions.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tài khoản')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Profile header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: context.colorScheme.surface,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: context.colorScheme.primary.withOpacity(
                      0.1,
                    ),
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: context.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text('Người dùng', style: context.textTheme.headlineSmall),
                  const SizedBox(height: 4),
                  Text(
                    'user@example.com',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Menu items
            _buildMenuItem(
              context,
              icon: Icons.person_outline,
              title: 'Thông tin cá nhân',
              onTap: () => _showComingSoon(context),
            ),
            _buildMenuItem(
              context,
              icon: Icons.shopping_bag_outlined,
              title: 'Đơn hàng của tôi',
              onTap: () => _showComingSoon(context),
            ),
            _buildMenuItem(
              context,
              icon: Icons.favorite_outline,
              title: 'Yêu thích',
              onTap: () => _showComingSoon(context),
            ),
            _buildMenuItem(
              context,
              icon: Icons.location_on_outlined,
              title: 'Địa chỉ giao hàng',
              onTap: () => _showComingSoon(context),
            ),
            _buildMenuItem(
              context,
              icon: Icons.payment_outlined,
              title: 'Phương thức thanh toán',
              onTap: () => _showComingSoon(context),
            ),
            _buildMenuItem(
              context,
              icon: Icons.settings_outlined,
              title: 'Cài đặt',
              onTap: () => _showComingSoon(context),
            ),
            _buildMenuItem(
              context,
              icon: Icons.help_outline,
              title: 'Trợ giúp',
              onTap: () => _showComingSoon(context),
            ),
            _buildMenuItem(
              context,
              icon: Icons.logout,
              title: 'Đăng xuất',
              onTap: () => _showLogoutDialog(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 5,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: context.colorScheme.primary),
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  void _showComingSoon(BuildContext context) {
    context.showSnackBar('Tính năng đang được phát triển');
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Đăng xuất'),
        content: const Text('Bạn có chắc chắn muốn đăng xuất?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Hủy'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              context.go('/login');
            },
            child: const Text('Đăng xuất'),
          ),
        ],
      ),
    );
  }
}
