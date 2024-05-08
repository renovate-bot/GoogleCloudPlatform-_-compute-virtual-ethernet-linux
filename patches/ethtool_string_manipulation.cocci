@ ethtool_puts @
expression s, input;
@@

+#if LINUX_VERSION_CODE >= KERNEL_VERSION(6,8,0)
ethtool_puts(s, input);
+#else /* LINUX_VERSION_CODE < KERNEL_VERSION(6,8,0) */
+strscpy(*s, input, ETH_GSTRING_LEN);
+ *s += ETH_GSTRING_LEN;
+#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(6,8,0) */

@ ethtool_sprintf @
expression s, fmt, arg;
@@

+#if LINUX_VERSION_CODE >= KERNEL_VERSION(5,13,0)
ethtool_sprintf(s, fmt, arg);
+#else /* LINUX_VERSION_CODE < KERNEL_VERSION(5,13,0) */
+snprintf(*s, ETH_GSTRING_LEN, fmt, arg);
+ *s += ETH_GSTRING_LEN;
+#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(5,13,0) */