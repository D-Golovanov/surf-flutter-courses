int getIntColor(String hex) => int.parse('0xFF${hex.replaceAll('#', '')}');
