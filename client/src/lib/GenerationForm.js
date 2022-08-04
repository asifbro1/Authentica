import { Button, Checkbox, Form, Input } from 'antd';
import React from 'react';

const CertificateGenerator = () => {
  const onFinish = (values) => {
    console.log('Success:', values);
  };

  const onFinishFailed = (errorInfo) => {
    console.log('Failed:', errorInfo);
  };

  return (
    <Form
      name="basic"
      labelCol={{
        span: 8,
      }}
      wrapperCol={{
        span: 16,
      }}
      initialValues={{
        remember: true,
      }}
      onFinish={onFinish}
      onFinishFailed={onFinishFailed}
      autoComplete="off"
    >
      <Form.Item
        label="Name"
        name="name"
        rules={[
          {
            required: true,
            message: 'Name in  your certificate',
          },
        ]}
      >
        <Input />
      </Form.Item>
      <Form.Item
        label="Course Title"
        name="courseTitle"
      >
        <Input />
      </Form.Item>

      <Form.Item
        label="Course Issuer"
        name="courseIssuer"
      >
        <Input />
      </Form.Item>
      
      <Form.Item
        label="Course Duration"
        name="courseDuration"
      >
        <Input />
      </Form.Item>

      <Form.Item
        wrapperCol={{
          offset: 8,
          span: 16,
        }}
      >
        <Button type="primary" htmlType="submit">
          Submit
        </Button>
      </Form.Item>
    </Form>
  );
};

export default CertificateGenerator;